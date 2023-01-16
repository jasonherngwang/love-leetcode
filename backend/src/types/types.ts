import { Difficulty } from '@prisma/client';

export interface Problem {
  name: string;
  category: string;
  difficulty: Difficulty;
  source: string;
  link: string;
}
