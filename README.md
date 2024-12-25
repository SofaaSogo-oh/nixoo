> So far so good home manager config

That's it, it's home manager profile

It's flake, so... You need

```sh
home-manager switch --flake .
```

And then, you can just write ``hms`` independed on the current directory. And, oh, you can change config using ``pkgs`` alias, btw.
