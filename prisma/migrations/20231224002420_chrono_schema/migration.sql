/*
  Warnings:

  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Post";

-- DropEnum
DROP TYPE "PosterSource";

-- CreateTable
CREATE TABLE "Game" (
    "id" SERIAL NOT NULL,
    "gameCode" INTEGER NOT NULL,
    "isActive" BOOLEAN NOT NULL,
    "roundsPlayed" INTEGER NOT NULL DEFAULT 0,
    "roundEventId" INTEGER NOT NULL,

    CONSTRAINT "Game_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Event" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "description" TEXT,
    "month" INTEGER,
    "day" INTEGER,

    CONSTRAINT "Event_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Timeline" (
    "id" SERIAL NOT NULL,
    "ableToWin" BOOLEAN NOT NULL,
    "activelyPlaying" BOOLEAN NOT NULL,
    "playerId" INTEGER NOT NULL,
    "gameId" INTEGER NOT NULL,

    CONSTRAINT "Timeline_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Player" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Player_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_TimelineToEvent" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Player_name_key" ON "Player"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_TimelineToEvent_AB_unique" ON "_TimelineToEvent"("A", "B");

-- CreateIndex
CREATE INDEX "_TimelineToEvent_B_index" ON "_TimelineToEvent"("B");

-- AddForeignKey
ALTER TABLE "Game" ADD CONSTRAINT "Game_roundEventId_fkey" FOREIGN KEY ("roundEventId") REFERENCES "Event"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Timeline" ADD CONSTRAINT "Timeline_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Timeline" ADD CONSTRAINT "Timeline_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_TimelineToEvent" ADD CONSTRAINT "_TimelineToEvent_A_fkey" FOREIGN KEY ("A") REFERENCES "Event"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_TimelineToEvent" ADD CONSTRAINT "_TimelineToEvent_B_fkey" FOREIGN KEY ("B") REFERENCES "Timeline"("id") ON DELETE CASCADE ON UPDATE CASCADE;
