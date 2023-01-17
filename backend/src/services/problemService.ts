import { PrismaClient } from '@prisma/client';
import { Problem, ProblemWithId } from '../types/types';

const prisma = new PrismaClient();

async function getProblems() {
  const allProblems: ProblemWithId[] = await prisma.problem.findMany({
    select: {
      problem_id: true,
      name: true,
      category: true,
      difficulty: true,
      source: true,
      link: true,
    },
  });
  return allProblems;
}

async function getProblem(problemId: string) {
  const problem: ProblemWithId | null = await prisma.problem.findUnique({
    where: {
      problem_id: problemId,
    },
    select: {
      problem_id: true,
      name: true,
      category: true,
      difficulty: true,
      source: true,
      link: true,
    },
  });
  return problem;
}

async function addProblem(newProblem: Problem) {
  const addedProblem: ProblemWithId | null = await prisma.problem.create({
    data: newProblem,
    select: {
      problem_id: true,
      name: true,
      category: true,
      difficulty: true,
      source: true,
      link: true,
    },
  });
  return addedProblem;
}

async function updateProblem(problemId: string, updatedData: Problem) {
  const updatedProblem: ProblemWithId | null = await prisma.problem.update({
    where: {
      problem_id: problemId,
    },
    data: updatedData,
    select: {
      problem_id: true,
      name: true,
      category: true,
      difficulty: true,
      source: true,
      link: true,
    },
  });
  return updatedProblem;
}

async function deleteProblem(problemId: string) {
  await prisma.problem.delete({
    where: {
      problem_id: problemId,
    },
  });
}

export default {
  getProblems,
  getProblem,
  addProblem,
  updateProblem,
  deleteProblem,
};
