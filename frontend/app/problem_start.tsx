'use client';
import { useState, useEffect } from 'react';
import { getProblems } from '@/lib/problemService';
import FilterProblems from './problem_filter';
import Problem from '@/types/types';

export type Filters = {
  neetcode: boolean;
  userSubmitted: boolean;
};

export default function StartProblem() {
  const [problem, setProblem] = useState(null);
  const [problems, setProblems] = useState(Object.create(null));
  const [time, setTime] = useState(null);
  const [filters, setFilters] = useState({
    neetcode: false,
    userSubmitted: false,
  });

  const updateFilters = (newFilters: Filters) => {
    setFilters(newFilters);
  };

  const randomProblem = () => {
    const filteredProblems = problems.filter(
      (problem: Problem) =>
        problem.source == 'capstone' ||
        (filters['neetcode'] && problem.source == 'neetcode') ||
        (filters['userSubmitted'] && problem.source == 'user_submitted')
    );
    const random = Math.floor(Math.random() * filteredProblems.length);
    setProblem(filteredProblems[random]);
  };

  useEffect(() => {
    const fetchProblems = async () => {
      const problems = await getProblems();
      setProblems(problems);
    };
    void fetchProblems();
  }, []);

  return (
    <div>
      <FilterProblems updateFilters={updateFilters} filters={filters} />

      <div className="flex flex-col items-center">
        <div className="relative mt-4 grid h-60 w-full grid-cols-2 rounded-lg border-2 border-red-700 p-4">
          <div className="flex flex-col items-center border-r pr-16">
            <h2 className="text-lg font-semibold uppercase tracking-wider text-neutral-500">
              Time
            </h2>
            <div>{time}</div>
          </div>
          <button
            type="button"
            className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2"
            onClick={(e) => randomProblem()}
          >
            <div className="flex h-24 w-24 flex-col items-center justify-center rounded-full border-2 border-neutral-400 bg-neutral-200 p-6 text-2xl font-black uppercase tracking-wider text-neutral-800 shadow-xl hover:border-red-900 hover:bg-red-600 hover:text-white active:bg-red-800">
              <div>I ❤️</div>
              <div>L C</div>
            </div>
          </button>
          <div className="flex flex-col items-center pl-16">
            <h2 className="text-lg font-semibold uppercase tracking-wider text-neutral-500">
              Problem
            </h2>
            <div className="mt-6 text-center">
              {problem ? (
                <a
                  href={problem.link}
                  target="_blank"
                  rel="noreferrer"
                  className="text-2xl font-medium text-red-700 underline hover:text-red-600"
                >
                  {problem.name}
                </a>
              ) : (
                <p className="text-2xl font-medium text-neutral-400">
                  No problem selected yet
                </p>
              )}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
