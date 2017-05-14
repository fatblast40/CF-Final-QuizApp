<?php

/**
 * @param $successMessage
 */
function checkAndPrintSQLError($successMessage) {
    global $con;
    $error = $con->error;
    if ($error) {
        echo "<p>MySQL error:: $error</p>";
    } else {
        echo $successMessage;
    }
}

/**
 * @param mysqli_stmt $getQuery
 * @param mysqli_stmt $addQuery
 * @param $getParams
 * @param null $addParams
 * @return array|int
 */
function getFirstOrAddRecord(mysqli_stmt $getQuery, mysqli_stmt $addQuery, $getParams, $addParams=null) {
    try {
        return getFirstRecord($getQuery, $getParams);
    } catch (OutOfBoundsException $exception) {
        if (is_null($addParams)) {
            $addParams = $getParams;
        }
        return addRecord($addQuery, $addParams);
    }
}


/**
 * @param mysqli_stmt $query
 * @param $params
 */
function escapeBindExecute(mysqli_stmt $query, $params) {
    global $con;
    foreach ($params as $index => $param) {
        if ($index != 0) {
            $params[$index] = $con->real_escape_string($param);
        }
    }
    $query->bind_param(...$params);
    if (!$query->execute()) {
        throw new UnexpectedValueException('Get id failed: '.$con->error);
    }
}

/**
 * @param mysqli_stmt $query
 * @param $params
 *
 */
function getFirstRecord(mysqli_stmt $query, $params) {
    global $con;
    escapeBindExecute($query, $params);
    $result = $query->get_result();
    if (is_bool($result)) {
        throw new UnexpectedValueException('Get id failed: '.$con->error);
    }

    $data = $result->fetch_assoc();
    return $data;
}

/**
 * @param mysqli_stmt $query
 * @param $params
 * @return int
 */
function addRecord(mysqli_stmt $query, $params) {
    global $con;
    escapeBindExecute($query, $params);
    return (int)$con->insert_id;
}