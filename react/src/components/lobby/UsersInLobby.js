import { ListGroup } from "react-bootstrap";
import { useContext } from "react";
import { Button } from "react-bootstrap";
import UserContext from "../../context/user";
import tokenParser from "../../helpers/tokenParser";
import capitalize from "../../helpers/capitalize";

export default function UsersInLobby(props) {
  const { lobby, handleRemoveUserFromLobby } = props; // destructuring props // TODO in other files too
  // user: the one who is logged in
  const viewer = tokenParser(useContext(UserContext)); // user who is logged in

  const isHost = (user) => user.username === lobby.host.username;
  // craeate arrow function in a variable

  const characters = [
    "ranger",
    "ranger",
    "rogue",
    "rogue",
    "warrior",
    "warrior",
    "wizard",
    "wizard",
  ];
  const getCharacterFromId = (id) => {
    if (id === undefined) return "none";
    return characters[id - 1];
  };

  const getGenderFromId = (id) => {
    if (id === undefined) return "";
    return id % 2 ? "♂ " : "♀ ";
  };

  return (
    <ul className="flex flex-col space-y-2">
      {lobby.users
        .sort((a, b) =>
          a.username < b.username ? 1 : a.username > b.username ? -1 : 0
        ) // arbitrary but consistent order
        .map((user, idx) => (
          <li key={idx} className="bg-green-700 rounded-xl p-2 text-white">
            {!isHost(user) && isHost(viewer) && (
              // show me the kick button over a player only if i'm the host, and also if the player to kick is not me
              <button
                className="mr-2"
                onClick={(e) => handleRemoveUserFromLobby(user.username)}
              >
                ❌
              </button>
            )}
            {isHost(user) && <span className="m-0 p-1">👑</span>}{" "}
            {user.username +
              " — " +
              getGenderFromId(user.character?.id) +
              capitalize(getCharacterFromId(user.character?.id))}
          </li>
        ))}
    </ul>
  );
}
