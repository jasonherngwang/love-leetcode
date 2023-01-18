'use client';

import { API_URL } from '@/constants';
import { Problem } from '@/types/types';

interface ProblemListProps {
  problems: any;
  fetchProblems: () => Promise<void>;
}

export default function ProblemList({
  problems,
  fetchProblems,
}: ProblemListProps) {
  return (
    <div className="mt-12">
      <h1 className="text-2xl font-bold md:text-3xl">Problems</h1>
      <div>
        {problems &&
          Object.keys(problems)?.map((category: string) => {
            return (
              <ProblemCategory
                key={category}
                categoryName={category}
                categoryProblems={problems[category]}
                fetchProblems={fetchProblems}
              />
            );
          })}
      </div>
    </div>
  );
}

function ProblemCategory({
  categoryName,
  categoryProblems,
  fetchProblems,
}: any) {
  return (
    <div className="mt-8 md:mt-12">
      <h2 className="col-span-full border-b pb-2 text-xl font-medium">
        {categoryName}
      </h2>
      <div className="mt-3 md:grid md:grid-cols-3 md:gap-x-8">
        <div className="mt-4 md:mt-0">
          <h2 className="mb-1 text-sm font-bold uppercase tracking-widest text-red-800">
            Capstone
          </h2>
          <ul>
            {categoryProblems.hasOwnProperty('capstone') ? (
              categoryProblems['capstone']?.map((problem: Problem) => {
                return (
                  <ProblemItem
                    key={problem.problem_id}
                    problem={problem}
                    fetchProblems={fetchProblems}
                  />
                );
              })
            ) : (
              <p className="text-neutral-500">No problems</p>
            )}
          </ul>
        </div>
        <div className="mt-4 md:mt-0">
          <h2 className="mb-1 text-sm font-bold uppercase tracking-widest text-neutral-700">
            Added by Users
          </h2>
          <ul>
            {categoryProblems.hasOwnProperty('other') ? (
              categoryProblems['other']?.map((problem: Problem) => {
                return (
                  <ProblemItem
                    key={problem.problem_id}
                    problem={problem}
                    fetchProblems={fetchProblems}
                  />
                );
              })
            ) : (
              <p className="text-neutral-500">No problems</p>
            )}
          </ul>
        </div>
        <div className="mt-4 md:mt-0">
          <h2 className="mb-1 text-sm font-bold uppercase tracking-widest text-neutral-700">
            Neetcode
          </h2>
          <ul>
            {categoryProblems.hasOwnProperty('neetcode') ? (
              categoryProblems['neetcode']?.map((problem: Problem) => {
                return (
                  <ProblemItem
                    key={problem.problem_id}
                    problem={problem}
                    fetchProblems={fetchProblems}
                  />
                );
              })
            ) : (
              <p className="text-neutral-500">No problems</p>
            )}
          </ul>
        </div>
      </div>
    </div>
  );
}

function ProblemItem({ problem, fetchProblems }: any) {
  const { problem_id, name, source, link } = problem || {};

  const deleteProblem = async () => {
    if (!window.confirm(`Are you sure you want to delete "${problem.name}"?`))
      return;

    await fetch(`${API_URL}/${problem_id}`, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json',
      },
    });

    await fetchProblems();
  };

  return (
    <li className="mt-1">
      <a
        href={link}
        target="_blank"
        className="text-sm hover:text-red-700"
        rel="noreferrer"
      >
        {name}
      </a>
      {source == 'other' && (
        <button
          type="button"
          className="ml-4 text-sm text-indigo-600 hover:font-bold"
          onClick={deleteProblem}
        >
          (delete)
        </button>
      )}
    </li>
  );
}
