var dummyQualification = {
  '30LNDG': {
    'desc': '[DUMMY] Take Off and Landing',
    'last':
        '${DateTime.now().subtract(const Duration(days: 30 * 2)).toString().substring(8, 10)}/${DateTime.now().subtract(const Duration(days: 30 * 2)).toString().substring(5, 7)}/${DateTime.now().subtract(const Duration(days: 30 * 2)).toString().substring(2, 4)}',
    'expiry':
        '${DateTime.now().subtract(const Duration(days: 30)).toString().substring(8, 10)}/${DateTime.now().subtract(const Duration(days: 30)).toString().substring(5, 7)}/${DateTime.now().subtract(const Duration(days: 30)).toString().substring(2, 4)}'
  },
  'AVSECT': {
    'desc': '[DUMMY] AVSEC XJ',
    'last':
        '${DateTime.now().add(const Duration(days: 30)).toString().substring(8, 10)}/${DateTime.now().add(const Duration(days: 30)).toString().substring(5, 7)}/${DateTime.now().add(const Duration(days: 30)).toString().substring(2, 4)}',
    'expiry':
        '${DateTime.now().add(const Duration(days: 365 + 30)).toString().substring(8, 10)}/${DateTime.now().add(const Duration(days: 365 + 30)).toString().substring(5, 7)}/${DateTime.now().add(const Duration(days: 365 + 30)).toString().substring(2, 4)}',
  },
  'CRMXJ': {
    'desc': '[DUMMY] CRM XJ',
    'last':
        '${DateTime.now().subtract(const Duration(days: 335)).toString().substring(8, 10)}/${DateTime.now().subtract(const Duration(days: 335)).toString().substring(5, 7)}/${DateTime.now().subtract(const Duration(days: 335)).toString().substring(2, 4)}',
    'expiry':
        '${DateTime.now().add(const Duration(days: 30)).toString().substring(8, 10)}/${DateTime.now().add(const Duration(days: 30)).toString().substring(5, 7)}/${DateTime.now().add(const Duration(days: 30)).toString().substring(2, 4)}',
  },
  'DGR': {
    'desc': '[DUMMY] Dangerous Goods',
    'last':
        '${DateTime.now().subtract(const Duration(days: (365 * 2) - 30)).toString().substring(8, 10)}/${DateTime.now().subtract(const Duration(days: (365 * 2) - 30)).toString().substring(5, 7)}/${DateTime.now().subtract(const Duration(days: (365 * 2) - 30)).toString().substring(2, 4)}',
    'expiry':
        '${DateTime.now().add(const Duration(days: 365 + 30)).toString().substring(8, 10)}/${DateTime.now().add(const Duration(days: 365 + 30)).toString().substring(5, 7)}/${DateTime.now().add(const Duration(days: 365 + 30)).toString().substring(2, 4)}',
  },
  'ELPL': {
    'desc': '[DUMMY] ELP Level 4 5 & 6',
    'last':
        '${DateTime.now().subtract(const Duration(days: 365)).toString().substring(8, 10)}/${DateTime.now().subtract(const Duration(days: 365)).toString().substring(5, 7)}/${DateTime.now().subtract(const Duration(days: 365)).toString().substring(2, 4)}',
    'expiry':
        '${DateTime.now().add(const Duration(days: 365 * 2)).toString().substring(8, 10)}/${DateTime.now().add(const Duration(days: 365 * 2)).toString().substring(5, 7)}/${DateTime.now().add(const Duration(days: 365 * 2)).toString().substring(2, 4)}',
  },
  'IR1YEM': {
    'desc': '[DUMMY] IR EM-FDPQXJXT',
    'last':
        '${DateTime.now().subtract(const Duration(days: 30)).toString().substring(8, 10)}/${DateTime.now().subtract(const Duration(days: 30)).toString().substring(5, 7)}/${DateTime.now().subtract(const Duration(days: 30)).toString().substring(2, 4)}',
    'expiry':
        '${DateTime.now().add(const Duration(days: 30 * 11)).toString().substring(8, 10)}/${DateTime.now().add(const Duration(days: 30 * 11)).toString().substring(5, 7)}/${DateTime.now().add(const Duration(days: 30 * 11)).toString().substring(2, 4)}',
  },
  'LCEM': {
    'desc': '[DUMMY] Line Check 12mth EOM',
    'last':
        '${DateTime.now().subtract(const Duration(days: 30 * 4)).toString().substring(8, 10)}/${DateTime.now().subtract(const Duration(days: 30 * 4)).toString().substring(5, 7)}/${DateTime.now().subtract(const Duration(days: 30 * 4)).toString().substring(2, 4)}',
    'expiry':
        '${DateTime.now().add(const Duration(days: 30 * 8)).toString().substring(8, 10)}/${DateTime.now().add(const Duration(days: 30 * 8)).toString().substring(5, 7)}/${DateTime.now().add(const Duration(days: 30 * 8)).toString().substring(2, 4)}',
  },
  'LIC5Y': {
    'desc': '[DUMMY] LICENSE ATPL/CPL',
    'last':
        '${DateTime.now().subtract(const Duration(days: 365 * 2)).toString().substring(8, 10)}/${DateTime.now().subtract(const Duration(days: 365 * 2)).toString().substring(5, 7)}/${DateTime.now().subtract(const Duration(days: 365 * 2)).toString().substring(2, 4)}',
    'expiry':
        '${DateTime.now().add(const Duration(days: 365 * 3)).toString().substring(8, 10)}/${DateTime.now().add(const Duration(days: 365 * 3)).toString().substring(5, 7)}/${DateTime.now().add(const Duration(days: 365 * 3)).toString().substring(2, 4)}',
  },
  'LNDG': {
    'desc': '[DUMMY] Take off and Landing',
    'last':
        '${DateTime.now().toString().substring(8, 10)}/${DateTime.now().toString().substring(5, 7)}/${DateTime.now().toString().substring(2, 4)}',
    'expiry':
        '${DateTime.now().add(const Duration(days: 60)).toString().substring(8, 10)}/${DateTime.now().add(const Duration(days: 60)).toString().substring(5, 7)}/${DateTime.now().add(const Duration(days: 60)).toString().substring(2, 4)}',
  },
  'LOFCTM': {
    'desc': '[DUMMY] LOFT 6mth CPT XJ',
    'last':
        '${DateTime.now().subtract(const Duration(days: 30)).toString().substring(8, 10)}/${DateTime.now().subtract(const Duration(days: 30)).toString().substring(5, 7)}/${DateTime.now().subtract(const Duration(days: 30)).toString().substring(2, 4)}',
    'expiry':
        '${DateTime.now().add(const Duration(days: 30 * 5)).toString().substring(8, 10)}/${DateTime.now().add(const Duration(days: 30 * 5)).toString().substring(5, 7)}/${DateTime.now().add(const Duration(days: 30 * 5)).toString().substring(2, 4)}',
  },
  'MEDEOD': {
    'desc': '[DUMMY] Medical End Date',
    'last':
        '${DateTime.now().subtract(const Duration(days: 30 * 4)).toString().substring(8, 10)}/${DateTime.now().subtract(const Duration(days: 30 * 4)).toString().substring(5, 7)}/${DateTime.now().subtract(const Duration(days: 30 * 4)).toString().substring(2, 4)}',
    'expiry':
        '${DateTime.now().add(const Duration(days: 30 * 8)).toString().substring(8, 10)}/${DateTime.now().add(const Duration(days: 30 * 8)).toString().substring(5, 7)}/${DateTime.now().add(const Duration(days: 30 * 8)).toString().substring(2, 4)}',
  },
  'OPCCTM': {
    'desc': '[DUMMY] OPC 6mth CPT-XJ',
    'last':
        '${DateTime.now().subtract(const Duration(days: 30)).toString().substring(8, 10)}/${DateTime.now().subtract(const Duration(days: 30)).toString().substring(5, 7)}/${DateTime.now().subtract(const Duration(days: 30)).toString().substring(2, 4)}',
    'expiry':
        '${DateTime.now().add(const Duration(days: 30 * 5)).toString().substring(8, 10)}/${DateTime.now().add(const Duration(days: 30 * 5)).toString().substring(5, 7)}/${DateTime.now().add(const Duration(days: 30 * 5)).toString().substring(2, 4)}',
  },
  'PP': {
    'desc': '[DUMMY] Passport',
    'last':
        '${DateTime.now().subtract(const Duration(days: 365)).toString().substring(8, 10)}/${DateTime.now().subtract(const Duration(days: 365)).toString().substring(5, 7)}/${DateTime.now().subtract(const Duration(days: 365)).toString().substring(2, 4)}',
    'expiry':
        '${DateTime.now().add(const Duration(days: 365 * 9)).toString().substring(8, 10)}/${DateTime.now().add(const Duration(days: 365 * 9)).toString().substring(5, 7)}/${DateTime.now().add(const Duration(days: 365 * 9)).toString().substring(2, 4)}',
  },
  'SE': {
    'desc': '[DUMMY] SMS and ERP',
    'last':
        '${DateTime.now().subtract(const Duration(days: 365 - 60)).toString().substring(8, 10)}/${DateTime.now().subtract(const Duration(days: 365 - 60)).toString().substring(5, 7)}/${DateTime.now().subtract(const Duration(days: 365 - 60)).toString().substring(2, 4)}',
    'expiry':
        '${DateTime.now().add(const Duration(days: 365 + 60)).toString().substring(8, 10)}/${DateTime.now().add(const Duration(days: 365 + 60)).toString().substring(5, 7)}/${DateTime.now().add(const Duration(days: 365 + 60)).toString().substring(2, 4)}'
  },
  'SEP': {
    'desc': '[DUMMY] SEP TC CC FD/XJ',
    'last':
        '${DateTime.now().subtract(const Duration(days: 365 - 30)).toString().substring(8, 10)}/${DateTime.now().subtract(const Duration(days: 365 - 30)).toString().substring(5, 7)}/${DateTime.now().subtract(const Duration(days: 365 - 30)).toString().substring(2, 4)}',
    'expiry':
        '${DateTime.now().add(const Duration(days: 30)).toString().substring(8, 10)}/${DateTime.now().add(const Duration(days: 30)).toString().substring(5, 7)}/${DateTime.now().add(const Duration(days: 30)).toString().substring(2, 4)}'
  },
};

var dummyAutoLandQualification = {
  'ATLNFLT': {
    'desc': '[DUMMY] Autoland in Aircraft',
    'last':
        '${DateTime.now().subtract(const Duration(days: 30 * 5)).toString().substring(8, 10)}/${DateTime.now().subtract(const Duration(days: 30 * 5)).toString().substring(5, 7)}/${DateTime.now().subtract(const Duration(days: 30 * 5)).toString().substring(2, 4)}',
    'expiry':
        '${DateTime.now().add(const Duration(days: 30)).toString().substring(8, 10)}/${DateTime.now().add(const Duration(days: 30)).toString().substring(5, 7)}/${DateTime.now().add(const Duration(days: 30)).toString().substring(2, 4)}',
  },
};
