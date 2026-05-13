String replace(String data) => '''
LOWER(
  REPLACE(
    REPLACE(
      REPLACE(
        REPLACE(
          REPLACE(
            REPLACE(
              REPLACE(
                REPLACE(
                  REPLACE(
                    REPLACE(
                      REPLACE(
                        REPLACE("$data", 'Á', 'A'), 
                      'À', 'A'), 
                    'Ã', 'A'),
                  'Â', 'A'),
                'Ó', 'O'),
              'Õ', 'O'),
            'Ô', 'O'),
          'Ú', 'U'),
        'É', 'E'),
      'Ê', 'E'),
    'Ê', 'E'),
  'Í', 'I')
)
''';
