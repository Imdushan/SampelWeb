<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" class="pane scroller">
    <head>
        <meta charset="utf-8">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>APPNAME</title>
        <link href="{{asset('/css/app.css') }}" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/@mdi/font@5.x/css/materialdesignicons.min.css" rel="stylesheet">

        <style>

            .pane {
                color: #2b2b2b;
                overflow-y: scroll;
                border: none !important;
            }
            .scroller {
                scrollbar-color: #2b2b2b;
                scrollbar-width: thin;
            }
            .scroller::-webkit-scrollbar {
                width: 10px;
                border: none !important;
            }
            .scroller::-webkit-scrollbar-track {
                background: #9E9E9E;
                border: none !important;
            }
            .scroller::-webkit-scrollbar-thumb {
                background: #2b2b2b;
                border: none !important;
            }
        </style>
        <script>
            window.Laravel = '{!! json_encode([
            'csrfToken' => csrf_token(),
            'user' => Auth::user(),  ]) !!}';
            window.setLogout = function () {
                document.getElementById('logout-form').submit();
            };
        </script>
    </head>
    <body>
        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
            @csrf
        </form>
        <v-app id="app">
            @yield('content')
        </v-app>
    </body>
    <script src="{{asset('/js/app.js')}}"></script>
</html>
