'use client';

import { useEffect, useState } from 'react';
import { getProblems } from '@/lib/problemService';
import { groupProblems } from '@/lib/processing';

import ProblemList from './problem_list';
import StartProblem from './problem_start';
import AddProblem from './problem_add_form';

export default function Home() {
  const [problems, setProblems] = useState<any>(null);
  const [groupedProblems, setGroupedProblems] = useState<any>(null);

  const fetchProblems = async function () {
    const problems = await getProblems();
    setProblems(problems);
    setGroupedProblems(groupProblems(problems));
  };

  useEffect(() => {
    void fetchProblems();
  }, []);

  return (
    <main className="mx-auto max-w-5xl p-4 sm:p-8">
      <h1 className="text-2xl font-medium tracking-wide text-neutral-600">
        LeetCode Random Problem Selector
      </h1>
      <p className="mt-4 font-medium text-neutral-700">
        Click <span className="font-black">I❤️LC</span> to select a random
        problem. Click on the problem link to open the problem in a new tab.
      </p>
      <p className="mt-1 font-medium text-neutral-700">
        You get 25 min for Easy, 40 for Medium, 60 for Hard. The clock starts
        immediately.
      </p>
      <p className="mt-4 text-sm font-medium text-neutral-500">
        The 65 problems we worked on in Capstone are always included. You can
        optionally include 115 extra problems from{' '}
        <a
          href="https://neetcode.io/practice"
          target="_blank"
          rel="noreferrer"
          className="text-red-700"
        >
          neetcode.io
        </a>
        {', '}
        and those added by users. There are no additional filters because we are
        training ourselves to see <em>any problem</em> and quickly identify the
        pattern.
      </p>
      <StartProblem problems={problems} />
      <AddProblem fetchProblems={fetchProblems} />
      <ProblemList problems={groupedProblems} />
    </main>
  );
}
