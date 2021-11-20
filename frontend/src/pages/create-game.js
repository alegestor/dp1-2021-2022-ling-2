import { useContext, useEffect, useState } from "react";
import { Button, Form } from "react-bootstrap";
import { useHistory } from "react-router-dom";
import userContext from "../context/user";
import tokenParser from "../helpers/tokenParser";
import axios from "../api/axiosConfig";

export default function CreateGame() {
  const history = useHistory(); // hook

  const { userToken } = useContext(userContext); // hook
  const user = tokenParser(useContext(userContext)); // hook

  const [gameName, setGameName] = useState(`${user.username}'s game`);
  const [maxPlayers, setMaxPlayers] = useState(4);
  const [scenesChecked, setScenesChecked] = useState(false);
  const [spectatorsChecked, setSpectatorsChecked] = useState(false);
  const [error, setError] = useState("");

  const handleCreateGame = async (e) => {
    e.preventDefault();
    try {
      // const formDataObj = Object.fromEntries(formData.entries());
      const payload = {
        name: gameName,
        max_players: maxPlayers,
        scenes: scenesChecked,
        spectators: spectatorsChecked,
      };
      const response = await axios.post("/games/new", payload);
      console.log(response);
      // history.push(ROUTES.GAME);
    } catch (error) {
      console.log(error);
      setError(error.message);
    }
  };

  useEffect(() => {
    document.title = "NTFH - Create new game";
  });

  return (
    <div>
      <h1>Create a new game</h1>
      <Form onSubmit={handleCreateGame}>
        <Form.Group className="mb-2">
          <Form.Label>Game name</Form.Label>
          <Form.Control
            type="text"
            placeholder={gameName}
            defaultValue={gameName}
            name="name"
            required
            onChange={(e) => setGameName(e.target.value)}
          />
        </Form.Group>
        <Form.Group key="inline-radio" className="mb-2">
          <Form.Label>Max players</Form.Label>
          <Form.Check
            inline
            label="2"
            name="maxPlayers"
            type="radio"
            onChange={(e) => setMaxPlayers(2)}
          />
          <Form.Check
            inline
            label="3"
            name="maxPlayers"
            type="radio"
            onChange={(e) => setMaxPlayers(3)}
          />
          <Form.Check
            inline
            label="4"
            name="maxPlayers"
            type="radio"
            defaultChecked
            onChange={(e) => setMaxPlayers(4)}
          />
        </Form.Group>
        <Form.Group className="mb-1">
          <Form.Check
            name="scenes"
            type="checkbox"
            label="Scenes"
            onChange={(e) => setSpectatorsChecked(!spectatorsChecked)}
          />
        </Form.Group>
        <Form.Group className="mb-2">
          <Form.Check
            name="spectatorsAllowed"
            type="checkbox"
            label="Spectators"
            onChange={(e) => setSpectatorsChecked(!spectatorsChecked)}
          />
        </Form.Group>
        <Button variant="primary" type="submit">
          Create
        </Button>
      </Form>
    </div>
  );
}
