export interface Problem {
  problem_id: string;
  name: string;
  category: string;
  difficulty: string;
  source: string;
  link: string;
}

export interface Votes {
  id: string;
  great: number;
  good: number;
  ok: number;
  bad: number;
  terrible: number;
}
