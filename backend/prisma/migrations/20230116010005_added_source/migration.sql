/*
  Warnings:

  - Added the required column `source` to the `Problem` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Problem" ADD COLUMN     "source" VARCHAR(255) NOT NULL;
