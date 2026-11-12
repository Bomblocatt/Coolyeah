/*
%FAKTA
ayah(budi, ani)
ayah(budi, siti)
ibu(siti, ani)
ibu(siti, andi)

%ATURAN
saudara(X, Y) :-
    orangtua(A, X)
    ibu(A, Y)
*/

% Aturan 1: Lampu garasi menyala jika MALAM dan ADA GERAKAN di garasi
nyalakan_lampu(garasi) :-
kondisi_waktu(malam),
terdeteksi_gerak(garasi).

% Aturan 2: Lampu garasi menyala jika MALAM dan SAKELAR OVERRIDE garasi aktif
nyalakan_lampu(garasi) :-
kondisi_waktu(malam),
sakelar_override(garasi).
