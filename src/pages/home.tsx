// import Link from 'next/link';
import { useState } from 'react';
// import { trpc } from 'utils/trpc';

export default function AboutPage() {
  //TODO get name from localStorage
  const [score, setScore] = useState<number>();
  const [name, setName] = useState<string>();
  const [gameCode, setGameCode] = useState<number>();

  return (
    <div>
      <section className="pb-8">
        <div className="flex gap-2">
          <div>Score to Win: </div>
          <input
            type="number"
            value={score}
            onChange={(e) => setScore(Number(e.target.value) ?? 0)}
          />
        </div>
        <div className="flex gap-2">
          <div>Name:</div>
          <input value={name} onChange={(e) => setName(e.target.value ?? '')} />
        </div>
        <button onClick={() => undefined}>Create Game</button>
      </section>
      <section>
        <div className="flex gap-2">
          <div>Name:</div>
          <input value={name} onChange={(e) => setName(e.target.value ?? '')} />
        </div>
        <div className="flex gap-2">
          <div>Game Code: </div>
          <input
            type="number"
            value={gameCode}
            onChange={(e) => setGameCode(Number(e.target.value) ?? 0)}
          />
        </div>
        <button onClick={() => undefined}>Join Game</button>
      </section>
    </div>
  );
}
