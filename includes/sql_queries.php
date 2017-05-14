<?php
$getCustomAvatarFileNameQuery = $con->prepare(<<<'SQL'
SELECT custom_avatar FROM users WHERE id = ?;
SQL
);

$setCustomAvatarFileNameQuery = $con->prepare(<<<'SQL'
UPDATE users SET custom_avatar = ? WHERE id = ?;
SQL
);