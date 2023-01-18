'use client';

import { useState, useEffect } from 'react';
import { getVotes, addVote } from '@/lib/voteService';
import { Votes } from '@/types/types';

export default function Voting() {
  const scoreEmojis = {
    great: '😻',
    good: '🐶',
    ok: '🙈',
    bad: '🤮',
    terrible: '☠️',
  };

  const [votes, setVotes] = useState<Votes | null>(null);

  const fetchVotes = async function () {
    const votes = await getVotes();
    setVotes(votes);
  };

  const vote = async function (score: string) {
    const updatedVotes = await addVote(score);
    setVotes(updatedVotes);
  };

  useEffect(() => {
    void fetchVotes();
  }, []);

  return (
    <div className="mt-6 flex flex-col items-center">
      <h3 className="text-sm font-medium text-neutral-600 md:text-lg">
        <span className="text-red-700">Survey: </span>What do you think of
        LeetCode?
      </h3>
      {votes && (
        <div className="mt-2 flex gap-3">
          {Object.entries(scoreEmojis).map(([score, emoji]) => {
            return (
              <button
                key={score}
                type="button"
                className="flex items-center rounded-full border py-1 px-1 hover:bg-neutral-100 md:px-3"
                onClick={() => vote(score)}
              >
                <span className="md:text-3xl">{emoji}</span>
                <span className="ml-2 text-sm font-semibold md:text-base">
                  {(votes as any)[score]}
                </span>
              </button>
            );
          })}
        </div>
      )}
    </div>
  );
}
