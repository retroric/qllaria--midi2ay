; Automatically generated by 'midi2ay'

	org	8000h

init	di
	ld	sp,0
	ld	hl,0feffh
	ld	(hl),isr and 0ffh
	inc	hl
	ld	(hl),isr shr 8
	ld	a,0feh
	ld	i,a
	im	2
	ei
	jr	$

isr	ld	hl,(pos)
loop	ld	a,(hl)
	or	a
	jr	nz,wait
	inc	hl
	ld	a,(hl)
	cp	0ffh
	jr	z,stop
	cp	0feh
	jr	z,break
	ld	bc,0fffdh
	out	(c),a
	inc	hl
	ld	a,(hl)
	ld	b,0bfh
	out	(c),a
	inc	hl
	jr	loop
wait	ld	(pos),hl
	dec	a
	ld	(hl),a
	ei
	ret
break	inc	hl
	inc	hl
	ld	(pos),hl
	ei
	ret
stop	xor	a
	out	(0feh),a
	jr	$

pos	dw	notes

notes
; BODY
;	db	0, 0ffh	; must be included at the end

end	init