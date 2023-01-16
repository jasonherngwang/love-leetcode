// Render page on client (browser), not server
'use client';
import { useRouter } from 'next/navigation';
import { FormEvent, useState } from 'react';

export default function AddProblem() {
  const [name, setName] = useState('');
  const [category, setCategory] = useState('General');
  const [difficulty, setDifficulty] = useState('easy');
  const [link, setLink] = useState('');

  const router = useRouter();

  const add = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    await fetch('http://localhost:3001/api/problems', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        name,
        category,
        difficulty,
        source: 'Other',
        link,
      }),
    });

    setName('');
    setCategory('General');
    setDifficulty('Easy');
    setLink('');

    // Fetch data (notes) from db w/o full-page refresh
    router.refresh();
  };

  return (
    <form
      onSubmit={(e) => add(e)}
      className="mt-8 rounded-lg border border-neutral-300 p-4"
    >
      <input
        type="text"
        name="name"
        placeholder="Problem Name"
        value={name}
        required
        onChange={(e) => setName(e.target.value)}
      />
      <select
        name="category"
        value={category}
        required
        onChange={(e) => setCategory(e.target.value)}
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
      >
        <option value="easy">Easy</option>
        <option value="medium">Medium</option>
        <option value="hard">Hard</option>
      </select>
      <input
        type="text"
        name="link"
        placeholder="https://leetcode.com/problems/PROBLEM_NAME"
        value={link}
        required
        onChange={(e) => setLink(e.target.value)}
      />
      <button type="submit">Add Problem</button>
    </form>
  );
}
