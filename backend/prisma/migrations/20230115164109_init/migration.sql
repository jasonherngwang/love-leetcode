-- CreateEnum
CREATE TYPE "Difficulty" AS ENUM ('EASY', 'MEDIUM', 'HARD');

-- CreateTable
CREATE TABLE "Problem" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "category" VARCHAR(255) NOT NULL,
    "difficulty" "Difficulty" NOT NULL DEFAULT 'EASY',
    "link" VARCHAR(255) NOT NULL,

    CONSTRAINT "Problem_pkey" PRIMARY KEY ("id")
);
