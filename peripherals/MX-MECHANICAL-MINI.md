# Logitech MX Mechanical Mini - Configuration Notes

## Keyboard Layout Issues

The MX Mechanical Mini may have keyboard layout conflicts on Linux, particularly with function keys and special shortcuts.

## Print Screen Fix (GNOME/Wayland)

By default, the Print Screen key may not work correctly on GNOME. To fix this:

```bash
gsettings set org.gnome.shell.keybindings show-screenshot-ui "['Print', '<Super><Shift>s']"
```

### Testing:
After running the command, press the `FN + F8` key to verify the screenshot UI appears.

### Reverting to default:
```bash
gsettings reset org.gnome.shell.keybindings show-screenshot-ui
```

---

## Additional Notes

- This fix is specifically for GNOME
- Other desktop environments (KDE, XFCE) may use different keybinding systems
- Check your DE's keyboard settings if Print Screen still doesn't work after applying this fix
