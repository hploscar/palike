import ApplicationAdapter from './application';
import config from '../config/environment';

export default ApplicationAdapter.extend({
  pathForType: (type) => {
    return "registrations"
  },
  host: config.APP.apiUrl,
  namespace: 'api/v1',
  headers: {
    'content-type': 'application/json',
    'accept': 'application/json'
  }
});
