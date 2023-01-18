'use client';

import { API_URL } from '@/constants';
import { useState } from 'react';

interface AddProblemProps {
  fetchProblems: () => Promise<void>;
}

export default function AddProblem({ fetchProblems }: AddProblemProps) {
  const [name, setName] = useState('');
  const [category, setCategory] = useState('General');
  const [difficulty, setDifficulty] = useState('easy');
  const [link, setLink] = useState('');
  const [error, setError] = useState('');

  const linkIsValid = () =>
    link.slice(0, 30) === 'https://leetcode.com/problems/';

  const setLinkInvalidError = () => {
    setError(
      'Link URL is invalid; must start with https://leetcode.com/problems/'
    );
  };

  const handleLinkInput = (value: string) => {
    setLink(value);
    if (!linkIsValid()) {
      setLinkInvalidError();
    } else {
      setError('');
    }
  };

  const add = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    if (!linkIsValid()) {
      setLinkInvalidError();
      return;
    }

    await fetch(API_URL, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        name,
        category,
        difficulty,
        source: 'other',
        link,
      }),
    });

    setName('');
    setCategory('General');
    setDifficulty('easy');
    setLink('');
    setError('');

    await fetchProblems();
  };

  return (
    <form
      onSubmit={(e) => add(e)}
      className="mt-10 rounded-lg border border-neutral-300 p-4"
    >
      <h2 className="mt-2 text-sm text-neutral-500 md:text-lg">
        Feel free to add problems you enjoyed:
      </h2>
      <div className="mt-4 flex gap-x-4 md:gap-x-8">
        <input
          type="text"
          name="name"
          placeholder="Problem Name"
          value={name}
          required
          onChange={(e) => setName(e.target.value)}
          className="placeholder-text-neutral-300 w-1/3 rounded-md border border-neutral-300 text-sm shadow-sm focus:border-red-700 focus:ring-red-700 md:text-base"
        />
        <input
          type="text"
          name="link"
          placeholder="https://leetcode.com/problems/PROBLEM_NAME"
          value={link}
          required
          onChange={(e) => handleLinkInput(e.target.value)}
          onBlur={(e) => handleLinkInput(e.target.value)}
          className="placeholder-text-neutral-300 w-2/3 rounded-md border border-neutral-300 text-sm shadow-sm focus:border-red-700 focus:ring-red-700 md:text-base"
        />
      </div>
      <div className="mt-4 flex flex-col gap-4 md:flex-row md:gap-x-8">
        <select
          name="category"
          value={category}
          required
          onChange={(e) => setCategory(e.target.value)}
          className="rounded-md border border-neutral-300 text-sm shadow-sm focus:border-red-700 focus:ring-red-700 md:text-base"
        >
          <option value="Arrays">Arrays</option>
          <option value="Backtracking">Backtracking</option>
          <option value="Binary Search">Binary Search</option>
          <option value="Bit Manipulation">Bit Manipulation</option>
          <option value="Dynamic Programming">Dynamic Programming</option>
          <option value="General">General</option>
          <option value="Graphs">Graphs</option>
          <option value="Graphs - Advanced">Graphs - Advanced</option>
          <option value="Greedy">Greedy</option>
          <option value="Heap / Priority Queue">Heap / Priority Queue</option>
          <option value="Intervals">Intervals</option>
          <option value="Linked List">Linked List</option>
          <option value="Math & Geometry">Math & Geometry</option>
          <option value="Pointers">Pointers</option>
          <option value="Recursion">Recursion</option>
          <option value="Sliding Window">Sliding Window</option>
          <option value="Stack">Stack</option>
          <option value="Trees">Trees</option>
          <option value="Tries">Tries</option>
        </select>
        <select
          name="difficulty"
          value={difficulty}
          required
          onChange={(e) => setDifficulty(e.target.value)}
          className="rounded-md border border-neutral-300 text-sm shadow-sm focus:border-red-700 focus:ring-red-700 md:text-base"
        >
          <option value="easy">Easy</option>
          <option value="medium">Medium</option>
          <option value="hard">Hard</option>
        </select>
      </div>
      <button
        type="submit"
        className="mt-6 mb-2 rounded-md bg-red-800 py-2 px-4 font-medium tracking-wider text-white"
      >
        Add Problem
      </button>
      <br className="md:hidden" />
      {error && <span className="text-red-700 md:ml-4">{error}</span>}
    </form>
  );
}
