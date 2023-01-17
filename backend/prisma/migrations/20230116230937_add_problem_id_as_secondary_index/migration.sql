/*
  Warnings:

  - The required column `problem_id` was added to the `Problem` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- AlterTable
ALTER TABLE "Problem" ADD COLUMN     "problem_id" TEXT NOT NULL;

-- CreateIndex
CREATE INDEX "Problem_problem_id_idx" ON "Problem"("problem_id");
