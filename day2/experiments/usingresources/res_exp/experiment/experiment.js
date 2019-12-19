var timeline = {
  "timeline": [
    {
      "type": ["image-button-response"],
      "stimulus": jsPsych.timelineVariable('my_stimulus'),
      "stimulus_height": [200],
      "stimulus_width": [200],
      "maintain_aspect_ratio": true,
      "choices": ["ugly", "okay", "pretty"],
      "margin_vertical": ["0px"],
      "margin_horizontal": ["8px"],
      "response_ends_trial": true,
      "post_trial_gap": [200]
    }
  ],
  "timeline_variables": [
    {
      "my_stimulus": ["resource/image/pic1.png"]
    },
    {
      "my_stimulus": ["resource/image/pic2.jpg"]
    },
    {
      "my_stimulus": ["resource/image/pic3.jpg"]
    }
  ],
  "randomize_order": [true]
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
