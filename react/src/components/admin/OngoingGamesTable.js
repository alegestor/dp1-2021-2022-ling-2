import axios from "../../api/axiosConfig";
import { useEffect, useState, useContext } from "react";
import { Table } from "react-bootstrap";
import errorContext from "../../context/error";

export default function OngoingGamesTable() {
  const { errors, setErrors } = useContext(errorContext); // Array of errors
  const [gameList, setGameList] = useState();

  const placeholderGameList = [
    {
      id: 2,
      startTime: "2020-04-01T00:00:00Z",
      hasScenes: true,
      players: ["stockie", "andres", "admin"],
      leader: ["stockie"]
    },
    {
      id: 4,
      startTime: "2021-11-13T16:52:01Z",
      hasScenes: false,
      players: ["stockie", "andres"],
      leader: ["andres"]
    },
  ];

  useEffect(() => {
    // get lobby list
    const fetchGames = async () => {
      try {
        const response = await axios.get(`games`);
        setGameList(response.data);
      } catch (error) {
        setErrors([...errors, error.response]);
      }
    };

    fetchGames();
  }, []);

  const renderPlayers = (game) => {
    var solution = "";
    for(var i in game.players){
      solution += game.players[i] + ", ";
    }
    return solution.substring(0, (solution.length - 2));
  };

  return (
    <Table>
      <thead>
        <tr>
          <th>id</th>
          <th>start_time</th>
          <th>has_scenes</th>
          <th>leader</th>
          <th>players</th>
        </tr>
      </thead>
      <tbody>
        {placeholderGameList.map((game, idx) => (
          <tr>
            <th>{game.id}</th>
            <th>{game.startTime}</th>
            <th>{game.hasScenes ? "🟢" : "🔴"}</th>
            <th>{game.leader}</th>
            <th>{renderPlayers(game)}</th>
          </tr>
        ))}
      </tbody>
    </Table>
  );
}
