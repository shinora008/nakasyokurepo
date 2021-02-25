import React, { Fragment, useEffect } from 'react' ;
import { fetchReports } from '../apis/reports';

export const Reports = () => {

  useEffect(() => {
    fetchReports()
    .then((data) =>
      console.log(data)
    )
  }, [])
  return (
    <Fragment>
        レポート一覧
    </Fragment>
  )
}
