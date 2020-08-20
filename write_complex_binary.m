function v = write_complex_binary (data, filename)

  %% usage: write_complex_binary (data, filename)
  %%
  %%  open filename and write data to it as 32 bit floats
  %%

  m = nargchk (1,2,nargin);
  if (m)
    usage (m);
  end

  f = fopen (filename, 'wb');
  if (f < 0)
    v = 0;
  else
    realdata = zeros(length(data), 2);
    realdata(:,1) = real(data);
    realdata(:,2) = imag(data);
    realdata = realdata';
    v = fwrite (f, realdata, 'float');
    fclose (f);
  end
end