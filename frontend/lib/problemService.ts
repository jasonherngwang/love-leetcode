export async function getProblems() {
  /* Allow Next fetch to cache data */
  const res = await fetch('http://localhost:3001/api/problems');
  const allProblems = await res.json();
  return allProblems;
}
