pro MinXSS_Tutorial 


;Load Data

path = '/Users/csuarez/Documents/GitHub/MinXSS_Flares_Spectra_Fitting/MinXSS_Data_Tutorial/'

;Restores sav file with MINXSSLEVEL1 structure
restore, path + 'minxss1_l1_mission_length_v3.1.0.sav', /verbose

stop 

;Show the organization of the sturcture for X123 and XP
;
;X123            STRUCT    -> <Anonymous> Array[16844]
;X123_META       STRUCT    -> <Anonymous> Array[1]
;X123_DARK       STRUCT    -> <Anonymous> Array[8730]
;XP              STRUCT    -> <Anonymous> Array[10859]
;XP_META         STRUCT    -> <Anonymous> Array[1]
;XP_DARK         STRUCT    -> <Anonymous> Array[8730]

help, MINXSSLEVEL1


stop 

;Plot the whole MinXSS mission series
year_mission = plot(MINXSSLEVEL1.X123.TIME.JD , MINXSSLEVEL1.X123.X123_SLOW_COUNT,  SYM_THICK = 3, $
          DIMENSIONS = [800, 600], $
          TITLE = 'MinXSS Mission Time Series', $
          XTITLE = 'Time [UTC]', $
          XTICKUNITS = ['Month', 'Year'], YTITLE = 'Count Rate (cps)')


stop 

;Plot of July 23, 2016 M5 flare 
;Indices are 3900 to 4150 

flare_time_series = plot(MINXSSLEVEL1.X123[3900:4150].TIME.JD ,MINXSSLEVEL1.X123[3900:4150].X123_SLOW_COUNT, SYM = 2,  SYM_THICK = 3, $
  DIMENSIONS = [800, 600], $
  TITLE = 'MinXSS M5 Flare Time Series', $
  XTITLE = 'Time [UTC]', $
   YTITLE = 'Count Rate (cps)', XTICKUNITS = ['Time'],  XTICKFORMAT = ['LABEL_DATE'])

stop


;Plot Spectra of flare


flare_spectra = plot(MINXSSLEVEL1.X123[4050].ENERGY ,MINXSSLEVEL1.X123[4050].IRRADIANCE, SYM = 1,  SYM_THICK = 3, $
  DIMENSIONS = [800, 600], $
  TITLE = 'MinXSS M5 Flare Spectra', $
  XTITLE = 'Energy [keV]', $
  YTITLE = 'Irradiance [photons / sec / cm$^2$ / keV]', XRANGE = [-0.8, 12], YRANGE = [1e3, 1e11],  /YLOG) 



end