'use client';

import { useCounterStore } from './counterStore';

export function Counter(): JSX.Element {
  const { count, increment, decrement, reset } = useCounterStore();

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-gray-100">
      <div className="bg-white rounded-lg shadow-lg p-8 w-80">
        <h1 className="text-3xl font-bold text-center mb-8 text-gray-800">
          카운터
        </h1>

        {/* 카운트 표시 */}
        <div className="text-6xl font-bold text-center mb-8 text-blue-600">
          {count}
        </div>

        {/* 버튼 그룹 */}
        <div className="grid grid-cols-3 gap-4">
          <button
            onClick={decrement}
            className="bg-red-500 hover:bg-red-600 text-white font-bold py-3 px-4 rounded-lg transition-colors duration-200"
          >
            감소
          </button>

          <button
            onClick={reset}
            className="bg-gray-500 hover:bg-gray-600 text-white font-bold py-3 px-4 rounded-lg transition-colors duration-200"
          >
            초기화
          </button>

          <button
            onClick={increment}
            className="bg-green-500 hover:bg-green-600 text-white font-bold py-3 px-4 rounded-lg transition-colors duration-200"
          >
            증가
          </button>
        </div>

        {/* 상태 정보 */}
        <div className="mt-8 text-center text-gray-600 text-sm">
          <p>현재 값: <span className="font-bold text-gray-800">{count}</span></p>
        </div>
      </div>
    </div>
  );
}
