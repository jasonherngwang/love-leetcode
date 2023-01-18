import { Problem } from '@/types/types';

function groupProblems(problems: Problem[]) {
  // The order covered in Capstone
  const categoryOrder = [
    'General',
    'Pointers',
    'Binary Search',
    'Linked List',
    'Recursion',
    'Dynamic Programming',
    'Stack',
    'Trees',
    'Backtracking',
    'Intervals',
    'Arrays',
    'Sliding Window',
    'Heap / Priority Queue',
    'Tries',
    'Greedy',
    'Graphs',
    'Advanced Graphs',
    'Math & Geometry',
    'Bit Manipulation',
  ];

  const sortOrder: { [key: string]: number } = {};

  categoryOrder.forEach((category, index) => {
    sortOrder[category] = index;
  });

  // Group problems array into nested object
  const groups = problems.reduce((result, problem) => {
    result[problem.category] = result[problem.category] || {};
    result[problem.category][problem.source] =
      result[problem.category][problem.source] || [];
    result[problem.category][problem.source].push(problem);
    return result;
  }, Object.create(null));

  // Sort by category
  const groupEntries: any = Object.entries(groups);
  groupEntries.sort((a: any, b: any) => sortOrder[a[0]] - sortOrder[b[0]]);

  return Object.fromEntries(groupEntries);
}

export { groupProblems };
