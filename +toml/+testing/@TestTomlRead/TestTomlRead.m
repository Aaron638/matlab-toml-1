classdef TestTomlRead < matlab.unittest.TestCase

  methods (Test)

    function testReadExample(testCase)
      matl_strct = struct( ...
          'title', 'TOML Example' ...
        , 'owner', struct( ...
            'name', 'Tom Preston-Werner' ...
          , 'dob', datetime('1979-05-27 07:32:00-08:00', ...
                            'InputFormat', 'yyyy-MM-dd HH:mm:ssZ', ...
                            'TimeZone', 'UTC') ...
            ) ...
        , 'database', struct( ...
            'server', '192.168.1.1' ...
          , 'ports', [8001, 8001, 8002] ...
          , 'connection_max', 5000 ...
          , 'enabled', true ...
            ) ...
        , 'servers', struct( ...
            'alpha', struct( ...
                'ip', '10.0.0.1' ...
              , 'dc', 'eqdc10' ...
                ) ...
          , 'beta', struct( ...
              'ip', '10.0.0.2' ...
            , 'dc', 'eqdc10' ...
              ) ...
            ) ...
        , 'clients', struct( ...
            'data', {{{'gamma', 'delta'}, [1, 2]}} ...
          , 'hosts', {{'alpha', 'omega'}} ...
            ) ...
          );

      c_dir = fileparts(mfilename('fullpath'));
      example_file = fullfile(c_dir, 'example.toml');

      testCase.verifyEqual(toml.read(example_file), matl_strct, ...
                           'Did not parse example TOML file correctly.')
    end

  end

end