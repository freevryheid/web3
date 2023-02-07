# web3
HTTP web server in fortran/c

Uses c sources from https://github.com/foxweb/pico

## git
```
git clone https://github.com/freevryheid/web3.git
cd web3
```

## fpm from terminal 1
```
FPM_FFLAGS="-ffree-form -Wno-tabs" fpm run
```

## test from terminal 2
```
curl --http0.9 http://localhost:8080/
curl --http0.9 http://localhost:8080/hello/
```


