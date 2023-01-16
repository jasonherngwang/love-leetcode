import { Filters } from './problem_start';

type FilterProps = {
  updateFilters: any;
  filters: {
    neetcode: boolean;
    userSubmitted: boolean;
  };
};

export default function FilterProblems({
  updateFilters,
  filters,
}: FilterProps) {
  const update = (newFilters: Filters) => {
    updateFilters(newFilters);
  };

  return (
    <div className="mt-8 flex gap-8">
      <div className="flex items-center gap-2">
        <label className="text-lg text-neutral-700">Include Neetcode</label>
        <input
          type="checkbox"
          name="neetcode"
          checked={filters.neetcode}
          className="h-5 w-5 rounded border-neutral-300 text-red-700 focus:ring-red-700"
          onChange={() =>
            update({
              ...filters,
              neetcode: !filters.neetcode,
            })
          }
        />
      </div>
      <div className="flex items-center gap-2">
        <label className="text-lg text-neutral-700">
          Include user-submitted
        </label>
        <input
          type="checkbox"
          name="user_submitted"
          checked={filters.userSubmitted}
          className="h-5 w-5 rounded border-neutral-300 text-red-700 focus:ring-red-700"
          onChange={() =>
            update({
              ...filters,
              userSubmitted: !filters.userSubmitted,
            })
          }
        />
      </div>
    </div>
  );
}
