import Problem from '@/types/types';

function groupProblems(problems: Problem[]) {
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

  const groups = problems.reduce((result, problem) => {
    result[problem.category] = result[problem.category] || {};
    result[problem.category][problem.source] =
      result[problem.category][problem.source] || [];
    result[problem.category][problem.source].push(problem);
    return result;
  }, Object.create(null));

  const groupEntries: any = Object.entries(groups);

  groupEntries.forEach((group: any) => {
    if (group[1].hasOwnProperty('capstone')) {
      group[1]['capstone'].sort((a: Problem, b: Problem) =>
        a.name.localeCompare(b.name)
      );
    }
    if (group[1].hasOwnProperty('neetcode')) {
      group[1]['neetcode'].sort((a: Problem, b: Problem) =>
        a.name.localeCompare(b.name)
      );
    }
  });

  groupEntries.sort((a: any, b: any) => sortOrder[a[0]] - sortOrder[b[0]]);

  return Object.fromEntries(groupEntries);
}

export { groupProblems };
