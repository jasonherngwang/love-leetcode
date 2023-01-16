import Problem from '@/types/types';
import { getProblems } from '@/lib/problemService';
import { groupProblems } from '@/lib/processing';

export default async function ProblemList() {
  let problems = await getProblems();
  problems = groupProblems(problems);

  return (
    <div className="mt-12">
      <h1 className="col- text-3xl font-bold">Problems</h1>
      <div>
        {Object.keys(problems)?.map((category: string) => {
          return (
            <ProblemCategory
              key={category}
              categoryName={category}
              categoryProblems={problems[category]}
            />
          );
        })}
      </div>
    </div>
  );
}

function ProblemCategory({ categoryName, categoryProblems }: any) {
  return (
    <div>
      <div className="mt-12 md:grid md:grid-cols-3 md:gap-x-2">
        <h2 className="text-xl font-medium">{categoryName}</h2>
        <div className="mt-2 md:mt-0">
          <h2 className="mb-1 text-sm font-bold uppercase tracking-widest text-red-800">
            Capstone
          </h2>
          <ul>
            {categoryProblems.hasOwnProperty('capstone') ? (
              categoryProblems['capstone']?.map((problem: Problem) => {
                return <ProblemItem key={problem.id} problem={problem} />;
              })
            ) : (
              <p className="text-neutral-500">No problems</p>
            )}
          </ul>
        </div>
        <div className="mt-3 md:mt-0">
          <h2 className="mb-1 text-sm font-bold uppercase tracking-widest text-neutral-700">
            Neetcode
          </h2>
          <ul>
            {categoryProblems.hasOwnProperty('neetcode') ? (
              categoryProblems['neetcode']?.map((problem: Problem) => {
                return <ProblemItem key={problem.id} problem={problem} />;
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

function ProblemItem({ problem }: any) {
  const { name, category, difficulty, source, link } = problem || {};

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
    </li>
  );
}
