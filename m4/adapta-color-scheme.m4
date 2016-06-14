# ADAPTA_COLOR_SCHEME ()
# -----------------------------------------------------------
AC_DEFUN([ADAPTA_COLOR_SCHEME], [

    selection_default="`grep 'Cyan500' gtk/sass/common/_colors.scss | \
                        cut -d' ' -f3`"
    second_selection_default="`grep 'Cyan300' gtk/sass/common/_colors.scss | \
                               cut -d' ' -f3`"
    accent_default="`grep 'Teal300' gtk/sass/common/_colors.scss | \
                     cut -d' ' -f3`"
    suggested_default="`grep 'Teal300' gtk/sass/common/_colors.scss | \
                        cut -d' ' -f3`"

    AC_ARG_WITH(
        [selection_color],
        [AS_HELP_STRING(
            [--with-selection_color],
            [Primary color for selected-items \
             (Default: $selection_default (Cyan500))]
        )],
        [SELECTION="$withval"],
        [SELECTION=$selection_default]
    )
    AC_SUBST([SELECTION])

    AC_ARG_WITH(
        [second_selection_color],
        [AS_HELP_STRING(
            [--with-second_selection_color],
            [Primary color for 'select' effects \
             (Default: $second_selection_default (Cyan300))]
        )],
        [SECOND_SELECTION="$withval"],
        [SECOND_SELECTION=$second_selection_default]
    )
    AC_SUBST([SECOND_SELECTION])

    AC_ARG_WITH(
        [accent_color],
        [AS_HELP_STRING(
            [--with-accent_color],
            [Secondary color for notifications and OSDs \
             (Default: $accent_default (Teal300))]
        )],
        [ACCENT="$withval"],
        [ACCENT=$accent_default]
    )
    AC_SUBST([ACCENT])

    AC_ARG_WITH(
        [suggested_color],
        [AS_HELP_STRING(
            [--with-suggested_color],
            [Suggestion color for specific buttons \
             (Default: $suggested_default (Teal500))]
        )],
        [SUGGESTED="$withval"],
        [SUGGESTED=$suggested_default]
    )
    AC_SUBST([SUGGESTED])

# Store defined custom color-scheme into SCSS file
echo \
"// Selection (Primary) color
\$custom_selection_color: `echo $SELECTION`;

// Sub-selection-color
\$custom_secondary_selection_color: `echo $SECOND_SELECTION`;

// Accent (Seondary) color
\$custom_accent_color: `echo $ACCENT`;

// Suggestion color
\$custom_suggestion_color: `echo $SUGGESTED`;" \
> ./gtk/sass/common/_custom_colors.scss

AC_MSG_RESULT([creating sass/common/_custom_colors.scss])

# Sync SCSS to shell build-directory
cp -Rv ./gtk/sass/common/_custom_colors.scss \
       ./shell/sass/common/_custom_colors.scss
])
