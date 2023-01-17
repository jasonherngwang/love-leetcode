import { API_URL } from '@/constants';

export async function getProblems() {
  const res = await fetch(API_URL);
  const allProblems = await res.json();
  return allProblems;
}
