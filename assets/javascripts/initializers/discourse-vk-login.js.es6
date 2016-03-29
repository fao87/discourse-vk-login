import Sharing from 'discourse/lib/sharing';

export default {
  name: 'discourse-vk-login',

  initialize: function() {

    Sharing.addSource({
      id: 'vkontankte',
      faIcon: 'fa-vk-square',
      generateUrl: function(link, title) {
        // https://vk.com/dev/share_details
        return "http://vk.com/share.php?url=" + encodeURIComponent(link) + "&title=" + encodeURIComponent(title);
      },
      shouldOpenInPopup: true,
      title: I18n.t('share.vkontankte'),
      popupHeight: 370
    });

  }
};
