<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

class VerifyCsrfToken extends Middleware
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array
     */
    protected $except = [
        'http://127.0.0.1:8000/api/register',
        'http://127.0.0.1:8000/api/login',
        'http://127.0.0.1:8000/api/user/logout',
        'http://127.0.0.1:8000/api/user/user',
        'http://127.0.0.1:8000/api/users/user/update',
        'http://127.0.0.1:8000/api/house/houses',
        'http://127.0.0.1:8000/api/history',
        'http://127.0.0.1:8000/api/users/user/delete',
        'http://127.0.0.1:8000/api/house/update',
        'http://127.0.0.1:8000/api/house/containers',
        'http://127.0.0.1:8000/api/house/containers/update',
        'http://127.0.0.1:8000/api/export/users',
        'http://127.0.0.1:8000/api/import/users',

        'http://127.0.0.1:8000/api/house/users',
        'http://127.0.0.1:8000/api/moderator/house',
        'http://127.0.0.1:8000/api/container/create',
        'http://127.0.0.1:8000/api/container/remove'
    ];
}
