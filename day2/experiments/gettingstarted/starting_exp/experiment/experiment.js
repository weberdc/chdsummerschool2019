var timeline = {
  "timeline": [
    {
      "type": ["instructions"],
      "pages": ["Welcome! Use the arrow buttons to browse these instructions.", "In this experiment you will solve some equations.<br><br>It is <i>very important<\/i> that you do your best.", "Press the 'Forward' button to begin!"],
      "key_forward": [78],
      "key_backward": [66],
      "allow_backward": true,
      "allow_keys": true,
      "show_clickable_nav": true,
      "button_label_previous": ["Backward (b)"],
      "button_label_next": ["Forward (n)"],
      "post_trial_gap": [1000]
    },
    {
      "type": ["html-button-response"],
      "stimulus": ["13 + 14 = 26"],
      "choices": ["true", "false"],
      "margin_vertical": ["0px"],
      "margin_horizontal": ["8px"],
      "response_ends_trial": true,
      "post_trial_gap": [500]
    }
  ]
};

jsPsych.init(
{
  "timeline": [timeline],
  "on_finish": function() {
    var data = jsPsych.data.get().csv();
    var file = 'xprmntr_local_name';
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'submit');
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify({filename: file, filedata: data}));
  }
}
);
