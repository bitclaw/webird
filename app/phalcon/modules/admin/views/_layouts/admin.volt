<!DOCTYPE html>
<html>
<head>
  <title>Webird Admin Page</title>
{{ common('head_init') }}
  {{ stylesheet_link(['href': 'css/commons/init_complex.css']) }}
</head>
<body>
<nav class="navbar navbar-inverse" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-content">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      {{ link_to(null, 'class': 'navbar-brand', 'Webird') }}
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="navbar-content">
      <ul class="nav navbar-nav">
        {%- set menus = [
          'features': this.translate.t('Features'),
          'admin': this.translate.t('Admin')
        ] -%}

        {%- for key, value in menus %}
          {% if value == dispatcher.getControllerName() %}
          <li class="active">{{ link_to(key, value) }}</li>
          {% else %}
          <li>{{ link_to(key, value) }}</li>
          {% endif %}
        {%- endfor -%}
      </ul>

      <ul class="nav navbar-nav navbar-right">
        <li>{{link_to('session/signout', 'Signout')}}</li>
      </ul>
    </div>

  </div><!-- /.container-fluid -->
</nav>

{{ content() }}
  {% if DEV %}<!--DEBUG_PANEL-->{% endif %}
  {{ javascript_include(['src': 'js/commons/init_complex.js']) }}
  {{ javascript_include(['src': 'js/entries/admin.js']) }}
</body>
</html>
