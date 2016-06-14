# ADAPTA_COLOR_SCHEME ()
# -----------------------------------------------------------
AC_DEFUN([ADAPTA_COLOR_SCHEME], [

    selection_default="#00BCD4"
    second_selection_default="#4DD0E1"
    accent_default="#4DB6AC"
    suggested_default="#009688"

    AC_ARG_WITH(
        [selection_color],
        [AS_HELP_STRING(
            [--with-selection_color],
            [Primary color for selected-items]
        )],
        [SELECTION="$withval"],
        [SELECTION=$selection_default]
    )
    AC_SUBST([SELECTION])

    AC_ARG_WITH(
        [second_selection_color],
        [AS_HELP_STRING(
            [--with-second_selection_color],
            [Primary color for 'select' effects]
        )],
        [SECOND_SELECTION="$withval"],
        [SECOND_SELECTION=$second_selection_default]
    )
    AC_SUBST([SECOND_SELECTION])

    AC_ARG_WITH(
        [accent_color],
        [AS_HELP_STRING(
            [--with-accent_color],
            [Secondary color for notifications and OSDs]
        )],
        [ACCENT="$withval"],
        [ACCENT=$accent_default]
    )
    AC_SUBST([ACCENT])

    AC_ARG_WITH(
        [suggested_color],
        [AS_HELP_STRING(
            [--with-suggested_color],
            [Suggestion color for specific buttons]
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
