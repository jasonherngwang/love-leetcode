import { PrismaClient } from '@prisma/client';
import problemService from '../src/services/problemService';
import { Problem } from '../src/types/types';

import seedData from '../data/seedData.json';

const prisma = new PrismaClient();

async function main() {
  await prisma.problem.deleteMany();

  for (const problem of seedData as Problem[]) {
    await problemService.addProblem(problem);
    console.log(`Added ${problem.name}`);
  }

  const allProblems = await problemService.getProblems();
  console.log(allProblems);
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
