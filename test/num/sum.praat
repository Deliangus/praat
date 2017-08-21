writeInfoLine: "sum..."

for i from 2 to 100
	assert sum (linear# (1, i, i, 0)) = sum (linear# (1, i - 1, i - 1, 0)) + i   ; 'i'
endfor

for i from 1 to 10
	appendInfoLine: sum (linear# (1, i, i, 0)), " ", mean (linear# (1, i, i, 0))
	assert sum (linear# (1, i, i, 0)) = i * mean (linear# (1, i, i, 0))   ; 'i'
endfor

durations# = zero# (100)
for n from 1 to 100
	result$ = Praat test: "TimeSum", string$ (10^8 / n), string$ (n), "", ""
	durations# [n] = extractNumber (result$, newline$)
	appendInfoLine (n, " ", durations# [n])
endfor

appendInfoLine: "mean ", mean (durations#), " nanoseconds"

;for n to 1000
appendInfoLine: "OK"