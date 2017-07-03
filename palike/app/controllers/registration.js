import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    registration: function() {
      let credentials = this.getProperties('email', 'password', 'username');
      let user = this.store.createRecord('user', credentials);
      user.save();
        // authenticator = 'authenticator:token';

      // this.get('session').authenticate(authenticator, credentials);
    }
  }
});
