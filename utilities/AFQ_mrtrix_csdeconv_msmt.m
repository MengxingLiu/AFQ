function [status, results] = AFQ_mrtrix_csdeconv_msmt(files, ...
                                                      lmax, ...
                                                      bkgrnd, ...
                                                      verbose, ...
                                                      mrtrixVersion)
%function [status, results] = mrtrix_csdeconv(dwi_file, response_file, lmax, ...
%           out_file, grad_file, [mask_file=entire volume], [verbose=true])
%
% Fit the constrained spherical deconvolution model to dwi data 
%
% Parameters
% ----------
% dwi_file: The name of a dwi file in .mif format. 
% response_file: The name of a .txt fiber response function file. 
% lmax: The maximal harmonic order. 
% out_file: The resulting .mif file. 
% grad_file: a file containing gradient information in the mrtrix format. 
% mask_file: a .mif file containing a mask. Default: the entire volume. 
% verbose: Whether to display stdout to the command window. 
% 
% Returns
% -------
% status: whether (0) or not (1) the operation succeeded
% results: the results of the operation in stdout
%
% Notes
% -----
% http://www.brain.org.au/software/mrtrix/tractography/preprocess.html
% 




cmd_str = ['dwi2fod msmt_csd ' ...
                     files.dwi ' ' ...
                     files.wmResponse  ' '  files.wmCsd ' '  ...
                     files.gmResponse  ' '  files.gmCsd ' '  ...
                     files.csfResponse ' '  files.csfCsd ' '  ...
                     '-mask ' files.wmMask_dilated ' ' ...
                     '-grad ' files.b ' ' ...
                     '-force'];

[status,results] = AFQ_mrtrix_cmd(cmd_str, bkgrnd, verbose,mrtrixVersion);
