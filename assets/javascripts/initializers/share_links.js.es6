import Sharing from 'discourse/lib/sharing';

export default {
  name: 'vk-share-link',

  initialize: function() {

    Sharing.addSource({
      id: 'vkontankte',
      iconClass: 'fa-vk',
      generateUrl: function(link, title) {
        // https://vk.com/dev/share_details
        return ("http://vk.com/share.php?url=" + encodeURIComponent(link) + "&title=" + encodeURIComponent(title));
      },
      shouldOpenInPopup: true,
      popupHeight: 370
    });

  }
};
