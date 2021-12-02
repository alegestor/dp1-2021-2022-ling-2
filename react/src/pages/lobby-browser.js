import { useContext, useEffect, useState } from "react";
import { Button, Table } from "react-bootstrap";
import { useHistory } from "react-router-dom";
import axios from "../api/axiosConfig";
import UserContext from "../context/user";
import Homebar from "../components/home/Homebar";
import * as ROUTES from "../constants/routes";
import toast from "react-hot-toast";

export default function LobbyBrowser() {
  const history = useHistory(); // hook
  const { userToken } = useContext(UserContext);

  const [lobbyList, setLobbyList] = useState([]);

  const fetchLobbies = async () => {
    try {
      const response = await axios.get(`lobbies`);
      setLobbyList(response.data);
    } catch (error) {
      toast.error(error.response?.data?.message);
      history.push("/not-found");
    }
  };

  useEffect(() => {
    fetchLobbies();
  }, []);

  const html = (
    <div>
      <div>
        <Homebar />
      </div>
      <h1>Lobby Browser</h1>
      {/* This should be a table fetching all games (With spectate button) and all lobbies
      (with join button). Each row could be rendered via different components since they will
      have different columns (?), maybe even two tables... we will see, now it doesn't matter */}
      <Table bordered hover striped>
        {/* TODO: Eventually turn this into a proper table or flex container */}
        <thead>
          <tr>
            <th>No.Players</th>
            <th>Game Name</th>
            <th>Scenes</th>
            <th>Spectators</th>
            <th>
              <Button type="submit" onClick={fetchLobbies}>
                ↻
              </Button>
            </th>
          </tr>
        </thead>
        <tbody>
          {lobbyList.map((lobby) => (
            <tr>
              <th>
                {lobby.users.length}/{lobby.maxPlayers}
              </th>
              <th>{lobby.name}</th>
              <th>{lobby.hasScenes ? "🟢" : "🔴"}</th>
              <th>{lobby.spectatorsAllowed ? "🟢" : "🔴"}</th>
              <th>
                {lobby.game ? ( // If the game has started
                  <Button
                    // type="secondary"
                    disabled={!lobby.spectatorsAllowed}
                    onClick={(e) =>
                      history.push(
                        ROUTES.GAME.replace(":gameId", lobby.game.id)
                      )
                    }
                  >
                    Spectate
                  </Button>
                ) : (
                  <Button
                    type="secondary"
                    disabled={lobby.users.length === lobby.maxPlayers}
                    onClick={(e) => {
                      userToken
                        ? history.push(
                            ROUTES.LOBBY.replace(":lobbyId", lobby.id)
                          )
                        : history.push(ROUTES.SIGNUP);
                    }}
                  >
                    Join
                  </Button>
                )}
              </th>
            </tr>
          ))}
        </tbody>
      </Table>
    </div>
  );

  return (
    <div className="flex flex-col h-screen bg-wood p-8 items-center">
      <span className="text-center btn-ntfh mb-4">
        <p className="text-5xl text-gradient-ntfh">Lobby browser</p>
      </span>
      <div className="flex flex-col">
        <div className="overflow-x-auto">
          <div className="py-2 align-middle inline-block min-w-full">
            <div className="shadow overflow-hidden border-b border-gray-900 rounded-xl">
              <table className="min-w-full divide-y divide-gray-200">
                <thead className="bg-gray-800">
                  <tr>
                    <th scope="col" className="text-table-th">
                      No.Players
                    </th>
                    <th scope="col" className="text-table-th">
                      Game Name
                    </th>
                    <th scope="col" className="text-table-th">
                      Scenes
                    </th>
                    <th scope="col" className="text-table-th">
                      Spectators
                    </th>
                    <th scope="col" className="text-table-th"></th>
                  </tr>
                </thead>
                <tbody className="bg-gray-900 divide-y divide-gray-200">
                  {lobbyList.map((lobby) => (
                    <tr key={lobby.id}>
                      <td className="text-table-td">
                        {lobby.users.length}/{lobby.maxPlayers}
                      </td>
                      <td className="text-table-td">{lobby.name}</td>
                      <td className="text-table-td">
                        {lobby.hasScenes ? "🟢" : "🔴"}
                      </td>
                      <td className="text-table-td">
                        {lobby.spectatorsAllowed ? "🟢" : "🔴"}
                      </td>
                      <td className="text-table-td">
                        {lobby.game ? ( // If the game has started
                          <button
                            className="btn-ntfh bg-gray-800"
                            disabled={!lobby.spectatorsAllowed}
                            onClick={(e) =>
                              history.push(
                                ROUTES.GAME.replace(":gameId", lobby.game.id)
                              )
                            }
                          >
                            <p
                              className={`text-xl text-gradient-ntfh ${
                                !lobby.spectatorsAllowed && "text-gray-500"
                              }`}
                            >
                              Spectate
                            </p>
                          </button>
                        ) : (
                          <button
                            className="btn-ntfh bg-gray-800"
                            disabled={lobby.users.length === lobby.maxPlayers}
                            onClick={(e) => {
                              userToken
                                ? history.push(
                                    ROUTES.LOBBY.replace(":lobbyId", lobby.id)
                                  )
                                : history.push(ROUTES.SIGNUP);
                            }}
                          >
                            <p
                              className={`text-xl text-gradient-ntfh ${
                                lobby.users.length === lobby.maxPlayers &&
                                "text-gray-500"
                              }`}
                            >
                              Join
                            </p>
                          </button>
                        )}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
