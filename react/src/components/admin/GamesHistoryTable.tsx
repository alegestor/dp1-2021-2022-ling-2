import playerParser from "../../helpers/playerParser";
import timeParser from "../../helpers/timeParser";
import { Game } from "../../interfaces/Game";

type Props = {
  data: Game[];
};

export default function GamesHistoryTable(props: Props) {
  const { data } = props;

  const tableHeaders = [
    "Id",
    "Duration",
    "Start Time",
    "Finish Time",
    "Scenes",
    "Winner",
    "Players",
  ];

  return (
    <div className="flex flex-col">
      <div className="overflow-x-auto">
        <div className="py-2 align-middle inline-block min-w-full">
          <div className="shadow overflow-hidden border-b border-gray-900 rounded-xl">
            <table className="min-w-full divide-y divide-gray-200">
              <thead className="bg-gray-800">
                <tr>
                  {tableHeaders.map((header, index) => (
                    <th key={index} scope="col" className="text-table-th">
                      {header}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody className="bg-gray-900 divide-y divide-gray-200">
                {data.map((game) => (
                  <tr key={game.id}>
                    <td className="text-table-td">{game.id}</td>
                    <td className="text-table-td">{game.duration}</td>
                    <td className="text-table-td">
                      {timeParser(game?.startTime)}
                    </td>
                    <td className="text-table-td">
                      {timeParser(game?.finishTime)}
                    </td>
                    <td className="text-table-td">
                      {game.hasScenes ? "🟢" : "🔴"}
                    </td>
                    <td className="text-table-td">
                      {game?.winner?.user.username}
                    </td>
                    <td className="text-table-td">
                      {playerParser(game.players)}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  );
}
