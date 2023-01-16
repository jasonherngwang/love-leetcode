import ProblemList from './problem_list';
import StartProblem from './problem_start';
import AddProblem from './problem_add_form';

export default function Home() {
  return (
    <main className="mx-auto max-w-5xl p-4 sm:p-8">
      <h1 className="text-2xl font-medium tracking-wide text-neutral-600">
        LeetCode Random Problem Selector
      </h1>
      <p className="mt-2 font-medium text-neutral-700">
        Capstone problems are always included. You can add in problems from{' '}
        <a
          href="https://neetcode.io/practice"
          target="_blank"
          rel="noreferrer"
          className="text-red-700"
        >
          neetcode.io
        </a>{' '}
        and those submitted by users.
      </p>
      <p className="mt-2 font-medium text-neutral-700">
        You get 25 min for Easy, 40 for Medium, 60 for Hard.
      </p>
      <p className="mt-2 font-medium text-neutral-700">
        Click I❤️LC to select a random problem. Click on the problem link to
        begin solving!
      </p>
      <StartProblem />
      <AddProblem />
      {/* TS doesn't understand async components yet */}
      {/* @ts-expect-error Server Component */}
      <ProblemList />
    </main>
  );
}
