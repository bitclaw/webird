<!DOCTYPE html>
<html>
<head>
  <title>{{t('Webird Public Page')}}</title>
{{ common('head_init') }}
  {{ stylesheet_link(['href': 'css/commons/init_complex.css']) }}
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-content">
        <span class="sr-only">{{t('Toggle navigation')}}</span>
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
          'about': this.translate.t('About')
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
        {% if 'signin' == dispatcher.getActionName() %}
        <li class="active">{{ link_to('signin', t('Signin')) }}</li>
        {% else %}
        <li>{{ link_to('signin', t('Signin')) }}</li>
        {% endif %}
      </ul>

    </div>
  </div><!-- /.container-fluid -->
</nav>

{{ content() }}

<div class="container">
  <div class="col-md-12 text-center">
    <footer class="top15">
        Webird
        {{ link_to("privacy", "Privacy Policy") }}
        {{ link_to("terms", "Terms") }}
    © 2014 Webird Team.
    </footer>
  </div>
</div>
  {{ javascript_include(['src': 'js/commons/init_complex.js']) }}
  {{ javascript_include(['src': 'js/entries/public.js']) }}
  {% if DEV %}<!--DEBUG_PANEL-->{% endif %}
</body>
</html>
