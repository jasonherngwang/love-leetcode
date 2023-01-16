import { PrismaClient } from '@prisma/client';
import { Problem } from '../types/types';

const prisma = new PrismaClient();

async function getProblems() {
  const allProblems = await prisma.problem.findMany();
  return allProblems;
}

async function addProblem(problem: Problem) {
  const addedProblem = await prisma.problem.create({
    data: problem,
  });
  return addedProblem;
}

async function updateProblem(id: string, updatedData: Problem) {
  console.log(updatedData);
  const updatedProblem = await prisma.problem.update({
    where: {
      id: Number(id),
    },
    data: updatedData,
  });
  return updatedProblem;
}

async function deleteProblem(id: string) {
  await prisma.problem.delete({
    where: {
      id: Number(id),
    },
  });
}

export default { getProblems, addProblem, updateProblem, deleteProblem };
