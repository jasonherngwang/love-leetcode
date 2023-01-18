import { useTimer } from 'react-timer-hook';

interface TimerProps {
  expiryTimestamp: Date;
  clearTimer: () => void;
}

export default function Timer({ expiryTimestamp, clearTimer }: TimerProps) {
  const {
    seconds,
    minutes,
    hours,
    days,
    isRunning,
    start,
    pause,
    resume,
    restart,
  } = useTimer({
    expiryTimestamp,
    onExpire: () => {
      alert("Time's up!");
      clearTimer();
    },
  });

  return (
    <div>
      <div>
        {hours > 0 && <span>{hours}:</span>}
        <span>
          {minutes.toLocaleString('en-US', {
            minimumIntegerDigits: 2,
            useGrouping: false,
          })}
        </span>
        :
        <span>
          {seconds.toLocaleString('en-US', {
            minimumIntegerDigits: 2,
            useGrouping: false,
          })}
        </span>
      </div>
      <button
        type="button"
        className="mt-6 rounded-md border-2 py-2 px-4 text-base font-semibold tracking-wide text-red-800 hover:bg-neutral-100 md:text-lg"
        onClick={() => clearTimer()}
      >
        Reset
      </button>
    </div>
  );
}
